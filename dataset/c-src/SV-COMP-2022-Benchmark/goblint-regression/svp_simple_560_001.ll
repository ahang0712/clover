; ModuleID = 'svp_simple_560_001.bc'
source_filename = "./svp_simple_560_001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@data = common global i32 0, align 4

; Function Attrs: nounwind uwtable
define void @assume_abort_if_not(i32 %0) #0 !dbg !7 {
  %2 = alloca i32, align 4
  store i32 %0, i32* %2, align 4, !tbaa !10
  %3 = load i32, i32* %2, align 4, !dbg !14, !tbaa !10
  %4 = icmp ne i32 %3, 0, !dbg !14
  br i1 %4, label %6, label %5, !dbg !15

5:                                                ; preds = %1
  call void @abort() #4, !dbg !16
  unreachable, !dbg !16

6:                                                ; preds = %1
  ret void, !dbg !17
}

; Function Attrs: noreturn
declare void @abort() #1

; Function Attrs: nounwind uwtable
define void @svp_simple_560_001_isr_1(i8* %0) #0 !dbg !18 {
  %2 = alloca i8*, align 8
  %3 = alloca i32, align 4
  store i8* %0, i8** %2, align 8, !tbaa !19
  %4 = bitcast i32* %3 to i8*, !dbg !21
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %4) #5, !dbg !21
  %5 = load i32, i32* @data, align 4, !dbg !22, !tbaa !10
  %6 = add nsw i32 %5, 1, !dbg !23
  store i32 %6, i32* %3, align 4, !dbg !24, !tbaa !10
  %7 = load i32, i32* %3, align 4, !dbg !25, !tbaa !10
  store i32 %7, i32* @data, align 4, !dbg !26, !tbaa !10
  %8 = bitcast i32* %3 to i8*, !dbg !27
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %8) #5, !dbg !27
  ret void, !dbg !27
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: nounwind uwtable
define i32 @svp_simple_560_001_main() #0 !dbg !28 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = bitcast i32* %1 to i8*, !dbg !29
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %3) #5, !dbg !29
  %4 = call i32 (...) @__VERIFIER_nondet_int(), !dbg !30
  store i32 %4, i32* %1, align 4, !dbg !31, !tbaa !10
  %5 = load i32, i32* %1, align 4, !dbg !32, !tbaa !10
  %6 = icmp sle i32 0, %5, !dbg !33
  br i1 %6, label %7, label %10, !dbg !34

7:                                                ; preds = %0
  %8 = load i32, i32* %1, align 4, !dbg !35, !tbaa !10
  %9 = icmp slt i32 %8, 10, !dbg !36
  br label %10

10:                                               ; preds = %7, %0
  %11 = phi i1 [ false, %0 ], [ %9, %7 ]
  %12 = zext i1 %11 to i32, !dbg !34
  call void @assume_abort_if_not(i32 %12), !dbg !37
  %13 = bitcast i32* %2 to i8*, !dbg !38
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %13) #5, !dbg !38
  %14 = load i32, i32* @data, align 4, !dbg !39, !tbaa !10
  %15 = add nsw i32 %14, 1, !dbg !40
  store i32 %15, i32* %2, align 4, !dbg !41, !tbaa !10
  %16 = load i32, i32* %2, align 4, !dbg !42, !tbaa !10
  store i32 %16, i32* @data, align 4, !dbg !43, !tbaa !10
  %17 = bitcast i32* %2 to i8*, !dbg !44
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %17) #5, !dbg !44
  %18 = bitcast i32* %1 to i8*, !dbg !44
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %18) #5, !dbg !44
  ret i32 0, !dbg !45
}

declare i32 @__VERIFIER_nondet_int(...) #3

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind willreturn }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, enums: !2)
!1 = !DIFile(filename: "svp_simple_560_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/SV-COMP-2022-Benchmark/goblint-regression")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
!7 = distinct !DISubprogram(name: "assume_abort_if_not", scope: !8, file: !8, line: 3, type: !9, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!8 = !DIFile(filename: "./svp_simple_560_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/SV-COMP-2022-Benchmark/goblint-regression")
!9 = !DISubroutineType(types: !2)
!10 = !{!11, !11, i64 0}
!11 = !{!"int", !12, i64 0}
!12 = !{!"omnipotent char", !13, i64 0}
!13 = !{!"Simple C/C++ TBAA"}
!14 = !DILocation(line: 4, column: 7, scope: !7)
!15 = !DILocation(line: 4, column: 6, scope: !7)
!16 = !DILocation(line: 4, column: 14, scope: !7)
!17 = !DILocation(line: 5, column: 1, scope: !7)
!18 = distinct !DISubprogram(name: "svp_simple_560_001_isr_1", scope: !8, file: !8, line: 11, type: !9, scopeLine: 11, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!19 = !{!20, !20, i64 0}
!20 = !{!"any pointer", !12, i64 0}
!21 = !DILocation(line: 13, column: 1, scope: !18)
!22 = !DILocation(line: 13, column: 9, scope: !18)
!23 = !DILocation(line: 13, column: 13, scope: !18)
!24 = !DILocation(line: 13, column: 5, scope: !18)
!25 = !DILocation(line: 14, column: 9, scope: !18)
!26 = !DILocation(line: 14, column: 7, scope: !18)
!27 = !DILocation(line: 17, column: 1, scope: !18)
!28 = distinct !DISubprogram(name: "svp_simple_560_001_main", scope: !8, file: !8, line: 19, type: !9, scopeLine: 19, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!29 = !DILocation(line: 21, column: 3, scope: !28)
!30 = !DILocation(line: 21, column: 11, scope: !28)
!31 = !DILocation(line: 21, column: 7, scope: !28)
!32 = !DILocation(line: 22, column: 28, scope: !28)
!33 = !DILocation(line: 22, column: 25, scope: !28)
!34 = !DILocation(line: 22, column: 30, scope: !28)
!35 = !DILocation(line: 22, column: 33, scope: !28)
!36 = !DILocation(line: 22, column: 35, scope: !28)
!37 = !DILocation(line: 22, column: 3, scope: !28)
!38 = !DILocation(line: 23, column: 3, scope: !28)
!39 = !DILocation(line: 23, column: 11, scope: !28)
!40 = !DILocation(line: 23, column: 15, scope: !28)
!41 = !DILocation(line: 23, column: 7, scope: !28)
!42 = !DILocation(line: 24, column: 9, scope: !28)
!43 = !DILocation(line: 24, column: 7, scope: !28)
!44 = !DILocation(line: 28, column: 1, scope: !28)
!45 = !DILocation(line: 27, column: 3, scope: !28)
