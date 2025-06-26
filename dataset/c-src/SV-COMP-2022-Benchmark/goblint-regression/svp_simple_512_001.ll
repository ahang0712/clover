; ModuleID = 'svp_simple_512_001.bc'
source_filename = "./svp_simple_512_001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@glob = common global i32 0, align 4
@.str = private unnamed_addr constant [22 x i8] c"Now we do the work..n\00", align 1
@.str.1 = private unnamed_addr constant [21 x i8] c"Work is completed...\00", align 1

; Function Attrs: nounwind uwtable
define void @svp_simple_512_001_isr_1(i8* %0) #0 !dbg !7 {
  %2 = alloca i8*, align 8
  %3 = alloca i32, align 4
  store i8* %0, i8** %2, align 8, !tbaa !10
  %4 = bitcast i32* %3 to i8*, !dbg !14
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %4) #3, !dbg !14
  %5 = load i32, i32* @glob, align 4, !dbg !15, !tbaa !16
  %6 = add nsw i32 %5, 1, !dbg !18
  store i32 %6, i32* %3, align 4, !dbg !19, !tbaa !16
  %7 = load i32, i32* %3, align 4, !dbg !20, !tbaa !16
  store i32 %7, i32* @glob, align 4, !dbg !21, !tbaa !16
  %8 = bitcast i32* %3 to i8*, !dbg !22
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %8) #3, !dbg !22
  ret void, !dbg !22
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nounwind uwtable
define i32 @svp_simple_512_001_main() #0 !dbg !23 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = bitcast i32* %1 to i8*, !dbg !24
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %3) #3, !dbg !24
  %4 = call i32 (...) @__VERIFIER_nondet_int(), !dbg !25
  store i32 %4, i32* %1, align 4, !dbg !26, !tbaa !16
  %5 = load i32, i32* %1, align 4, !dbg !27, !tbaa !16
  %6 = icmp ne i32 %5, 0, !dbg !27
  br i1 %6, label %7, label %9, !dbg !27

7:                                                ; preds = %0
  %8 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str, i32 0, i32 0)), !dbg !28
  br label %9, !dbg !28

9:                                                ; preds = %7, %0
  %10 = load i32, i32* %1, align 4, !dbg !29, !tbaa !16
  %11 = icmp ne i32 %10, 0, !dbg !29
  br i1 %11, label %12, label %18, !dbg !29

12:                                               ; preds = %9
  %13 = bitcast i32* %2 to i8*, !dbg !30
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %13) #3, !dbg !30
  %14 = load i32, i32* @glob, align 4, !dbg !31, !tbaa !16
  %15 = add nsw i32 %14, 1, !dbg !32
  store i32 %15, i32* %2, align 4, !dbg !33, !tbaa !16
  %16 = load i32, i32* %2, align 4, !dbg !34, !tbaa !16
  store i32 %16, i32* @glob, align 4, !dbg !35, !tbaa !16
  %17 = bitcast i32* %2 to i8*, !dbg !36
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %17) #3, !dbg !36
  br label %18, !dbg !36

18:                                               ; preds = %12, %9
  %19 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.1, i32 0, i32 0)), !dbg !37
  %20 = bitcast i32* %1 to i8*, !dbg !38
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %20) #3, !dbg !38
  ret i32 0, !dbg !39
}

declare i32 @__VERIFIER_nondet_int(...) #2

declare i32 @printf(i8*, ...) #2

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, enums: !2)
!1 = !DIFile(filename: "svp_simple_512_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/SV-COMP-2022-Benchmark/goblint-regression")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
!7 = distinct !DISubprogram(name: "svp_simple_512_001_isr_1", scope: !8, file: !8, line: 8, type: !9, scopeLine: 8, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!8 = !DIFile(filename: "./svp_simple_512_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/SV-COMP-2022-Benchmark/goblint-regression")
!9 = !DISubroutineType(types: !2)
!10 = !{!11, !11, i64 0}
!11 = !{!"any pointer", !12, i64 0}
!12 = !{!"omnipotent char", !13, i64 0}
!13 = !{!"Simple C/C++ TBAA"}
!14 = !DILocation(line: 9, column: 3, scope: !7)
!15 = !DILocation(line: 9, column: 13, scope: !7)
!16 = !{!17, !17, i64 0}
!17 = !{!"int", !12, i64 0}
!18 = !DILocation(line: 9, column: 17, scope: !7)
!19 = !DILocation(line: 9, column: 7, scope: !7)
!20 = !DILocation(line: 10, column: 10, scope: !7)
!21 = !DILocation(line: 10, column: 8, scope: !7)
!22 = !DILocation(line: 13, column: 1, scope: !7)
!23 = distinct !DISubprogram(name: "svp_simple_512_001_main", scope: !8, file: !8, line: 15, type: !9, scopeLine: 15, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!24 = !DILocation(line: 16, column: 3, scope: !23)
!25 = !DILocation(line: 16, column: 11, scope: !23)
!26 = !DILocation(line: 16, column: 7, scope: !23)
!27 = !DILocation(line: 17, column: 7, scope: !23)
!28 = !DILocation(line: 18, column: 3, scope: !23)
!29 = !DILocation(line: 19, column: 7, scope: !23)
!30 = !DILocation(line: 21, column: 7, scope: !23)
!31 = !DILocation(line: 21, column: 17, scope: !23)
!32 = !DILocation(line: 21, column: 21, scope: !23)
!33 = !DILocation(line: 21, column: 11, scope: !23)
!34 = !DILocation(line: 22, column: 14, scope: !23)
!35 = !DILocation(line: 22, column: 12, scope: !23)
!36 = !DILocation(line: 24, column: 3, scope: !23)
!37 = !DILocation(line: 26, column: 3, scope: !23)
!38 = !DILocation(line: 29, column: 1, scope: !23)
!39 = !DILocation(line: 28, column: 3, scope: !23)
