; ModuleID = 'svp_simple_521_001.bc'
source_filename = "./svp_simple_521_001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@glob = common global i32 0, align 4
@.str = private unnamed_addr constant [14 x i8] c"Do the work? \00", align 1
@.str.1 = private unnamed_addr constant [22 x i8] c"Now we do the work..n\00", align 1
@.str.2 = private unnamed_addr constant [21 x i8] c"Work is completed...\00", align 1

; Function Attrs: nounwind uwtable
define void @svp_simple_521_001_isr_1(i8* %0) #0 !dbg !7 {
  %2 = alloca i8*, align 8
  store i8* %0, i8** %2, align 8, !tbaa !10
  %3 = load i32, i32* @glob, align 4, !dbg !14, !tbaa !15
  %4 = add nsw i32 %3, 1, !dbg !14
  store i32 %4, i32* @glob, align 4, !dbg !14, !tbaa !15
  ret void, !dbg !17
}

; Function Attrs: nounwind uwtable
define i32 @svp_simple_521_001_main() #0 !dbg !18 {
  %1 = alloca i32, align 4
  %2 = bitcast i32* %1 to i8*, !dbg !19
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %2) #3, !dbg !19
  %3 = call i32 (...) @__VERIFIER_nondet_int(), !dbg !20
  store i32 %3, i32* %1, align 4, !dbg !21, !tbaa !15
  %4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i32 0, i32 0)), !dbg !22
  %5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1, i32 0, i32 0)), !dbg !23
  %6 = load i32, i32* %1, align 4, !dbg !24, !tbaa !15
  %7 = add nsw i32 %6, 1, !dbg !24
  store i32 %7, i32* %1, align 4, !dbg !24, !tbaa !15
  %8 = load i32, i32* %1, align 4, !dbg !25, !tbaa !15
  %9 = sub nsw i32 %8, 1, !dbg !26
  %10 = icmp ne i32 %9, 0, !dbg !26
  br i1 %10, label %11, label %14, !dbg !25

11:                                               ; preds = %0
  %12 = load i32, i32* @glob, align 4, !dbg !27, !tbaa !15
  %13 = add nsw i32 %12, 1, !dbg !27
  store i32 %13, i32* @glob, align 4, !dbg !27, !tbaa !15
  br label %14, !dbg !28

14:                                               ; preds = %11, %0
  %15 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.2, i32 0, i32 0)), !dbg !29
  %16 = load i32, i32* %1, align 4, !dbg !30, !tbaa !15
  %17 = add nsw i32 %16, -1, !dbg !30
  store i32 %17, i32* %1, align 4, !dbg !30, !tbaa !15
  %18 = bitcast i32* %1 to i8*, !dbg !31
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %18) #3, !dbg !31
  ret i32 0, !dbg !32
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

declare i32 @__VERIFIER_nondet_int(...) #2

declare i32 @printf(i8*, ...) #2

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, enums: !2)
!1 = !DIFile(filename: "svp_simple_521_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/SV-COMP-2022-Benchmark/goblint-regression")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
!7 = distinct !DISubprogram(name: "svp_simple_521_001_isr_1", scope: !8, file: !8, line: 9, type: !9, scopeLine: 9, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!8 = !DIFile(filename: "./svp_simple_521_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/SV-COMP-2022-Benchmark/goblint-regression")
!9 = !DISubroutineType(types: !2)
!10 = !{!11, !11, i64 0}
!11 = !{!"any pointer", !12, i64 0}
!12 = !{!"omnipotent char", !13, i64 0}
!13 = !{!"Simple C/C++ TBAA"}
!14 = !DILocation(line: 11, column: 7, scope: !7)
!15 = !{!16, !16, i64 0}
!16 = !{!"int", !12, i64 0}
!17 = !DILocation(line: 13, column: 1, scope: !7)
!18 = distinct !DISubprogram(name: "svp_simple_521_001_main", scope: !8, file: !8, line: 15, type: !9, scopeLine: 15, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!19 = !DILocation(line: 16, column: 3, scope: !18)
!20 = !DILocation(line: 16, column: 11, scope: !18)
!21 = !DILocation(line: 16, column: 7, scope: !18)
!22 = !DILocation(line: 19, column: 3, scope: !18)
!23 = !DILocation(line: 21, column: 3, scope: !18)
!24 = !DILocation(line: 22, column: 4, scope: !18)
!25 = !DILocation(line: 23, column: 7, scope: !18)
!26 = !DILocation(line: 23, column: 8, scope: !18)
!27 = !DILocation(line: 24, column: 9, scope: !18)
!28 = !DILocation(line: 24, column: 5, scope: !18)
!29 = !DILocation(line: 25, column: 3, scope: !18)
!30 = !DILocation(line: 26, column: 4, scope: !18)
!31 = !DILocation(line: 30, column: 1, scope: !18)
!32 = !DILocation(line: 29, column: 3, scope: !18)
