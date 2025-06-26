; ModuleID = 'svp_simple_331_001-opt.bc'
source_filename = "./svp_simple_331_001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@i = global i32 3, align 4
@j = global i32 6, align 4

; Function Attrs: nounwind uwtable
define void @reach_error() #0 !dbg !7 {
  %1 = call i32 (i32, ...) bitcast (i32 (...)* @assert to i32 (i32, ...)*)(i32 0), !dbg !10
  ret void, !dbg !11
}

declare i32 @assert(...) #1

; Function Attrs: nounwind uwtable
define void @svp_simple_331_001_isr_1(i8* %0) #0 !dbg !12 {
  br label %2, !dbg !13

2:                                                ; preds = %8, %1
  %.0 = phi i32 [ 0, %1 ], [ %9, %8 ], !dbg !14
  %3 = icmp slt i32 %.0, 20, !dbg !15
  br i1 %3, label %5, label %4, !dbg !16

4:                                                ; preds = %2
  br label %10

5:                                                ; preds = %2
  %6 = load i32, i32* @j, align 4, !dbg !17, !tbaa !18
  %7 = add nsw i32 %6, 1, !dbg !22
  store i32 %7, i32* @i, align 4, !dbg !23, !tbaa !18
  br label %8, !dbg !24

8:                                                ; preds = %5
  %9 = add nsw i32 %.0, 1, !dbg !25
  br label %2, !dbg !16, !llvm.loop !26

10:                                               ; preds = %4
  ret void, !dbg !27
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: nounwind uwtable
define void @svp_simple_331_001_isr_2(i8* %0) #0 !dbg !28 {
  br label %2, !dbg !29

2:                                                ; preds = %8, %1
  %.0 = phi i32 [ 0, %1 ], [ %9, %8 ], !dbg !30
  %3 = icmp slt i32 %.0, 20, !dbg !31
  br i1 %3, label %5, label %4, !dbg !32

4:                                                ; preds = %2
  br label %10

5:                                                ; preds = %2
  %6 = load i32, i32* @i, align 4, !dbg !33, !tbaa !18
  %7 = add nsw i32 %6, 1, !dbg !34
  store i32 %7, i32* @j, align 4, !dbg !35, !tbaa !18
  br label %8, !dbg !36

8:                                                ; preds = %5
  %9 = add nsw i32 %.0, 1, !dbg !37
  br label %2, !dbg !32, !llvm.loop !38

10:                                               ; preds = %4
  ret void, !dbg !39
}

; Function Attrs: nounwind uwtable
define i32 @svp_simple_331_001_main(i32 %0, i8** %1) #0 !dbg !40 {
  %3 = load i32, i32* @i, align 4, !dbg !41, !tbaa !18
  %4 = icmp sgt i32 %3, 46, !dbg !42
  %5 = zext i1 %4 to i32, !dbg !42
  %6 = load i32, i32* @j, align 4, !dbg !43, !tbaa !18
  %7 = icmp sgt i32 %6, 46, !dbg !44
  %8 = zext i1 %7 to i32, !dbg !44
  %9 = icmp ne i32 %5, 0, !dbg !45
  br i1 %9, label %12, label %10, !dbg !46

10:                                               ; preds = %2
  %11 = icmp ne i32 %8, 0, !dbg !47
  br i1 %11, label %12, label %15, !dbg !45

12:                                               ; preds = %10, %2
  br label %13, !dbg !48

13:                                               ; preds = %12
  %14 = call i32 (i32, ...) bitcast (i32 (...)* @assert to i32 (i32, ...)*)(i32 0) #4, !dbg !49
  call void @abort() #5, !dbg !51
  unreachable, !dbg !51

15:                                               ; preds = %10
  ret i32 undef, !dbg !52
}

; Function Attrs: noreturn
declare void @abort() #3

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind willreturn }
attributes #3 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { noreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, enums: !2)
!1 = !DIFile(filename: "svp_simple_331_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/SV-COMP-2022-Benchmark/pthread")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
!7 = distinct !DISubprogram(name: "reach_error", scope: !8, file: !8, line: 7, type: !9, scopeLine: 7, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!8 = !DIFile(filename: "./svp_simple_331_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/SV-COMP-2022-Benchmark/pthread")
!9 = !DISubroutineType(types: !2)
!10 = !DILocation(line: 7, column: 22, scope: !7)
!11 = !DILocation(line: 7, column: 33, scope: !7)
!12 = distinct !DISubprogram(name: "svp_simple_331_001_isr_1", scope: !8, file: !8, line: 14, type: !9, scopeLine: 14, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!13 = !DILocation(line: 15, column: 8, scope: !12)
!14 = !DILocation(line: 0, scope: !12)
!15 = !DILocation(line: 15, column: 21, scope: !12)
!16 = !DILocation(line: 15, column: 3, scope: !12)
!17 = !DILocation(line: 16, column: 9, scope: !12)
!18 = !{!19, !19, i64 0}
!19 = !{!"int", !20, i64 0}
!20 = !{!"omnipotent char", !21, i64 0}
!21 = !{!"Simple C/C++ TBAA"}
!22 = !DILocation(line: 16, column: 11, scope: !12)
!23 = !DILocation(line: 16, column: 7, scope: !12)
!24 = !DILocation(line: 17, column: 3, scope: !12)
!25 = !DILocation(line: 15, column: 29, scope: !12)
!26 = distinct !{!26, !16, !24}
!27 = !DILocation(line: 19, column: 1, scope: !12)
!28 = distinct !DISubprogram(name: "svp_simple_331_001_isr_2", scope: !8, file: !8, line: 21, type: !9, scopeLine: 21, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!29 = !DILocation(line: 22, column: 8, scope: !28)
!30 = !DILocation(line: 0, scope: !28)
!31 = !DILocation(line: 22, column: 21, scope: !28)
!32 = !DILocation(line: 22, column: 3, scope: !28)
!33 = !DILocation(line: 23, column: 9, scope: !28)
!34 = !DILocation(line: 23, column: 11, scope: !28)
!35 = !DILocation(line: 23, column: 7, scope: !28)
!36 = !DILocation(line: 24, column: 3, scope: !28)
!37 = !DILocation(line: 22, column: 29, scope: !28)
!38 = distinct !{!38, !32, !36}
!39 = !DILocation(line: 26, column: 1, scope: !28)
!40 = distinct !DISubprogram(name: "svp_simple_331_001_main", scope: !8, file: !8, line: 28, type: !9, scopeLine: 28, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!41 = !DILocation(line: 30, column: 15, scope: !40)
!42 = !DILocation(line: 30, column: 17, scope: !40)
!43 = !DILocation(line: 32, column: 15, scope: !40)
!44 = !DILocation(line: 32, column: 17, scope: !40)
!45 = !DILocation(line: 34, column: 7, scope: !40)
!46 = !DILocation(line: 34, column: 13, scope: !40)
!47 = !DILocation(line: 34, column: 16, scope: !40)
!48 = !DILocation(line: 34, column: 23, scope: !40)
!49 = !DILocation(line: 7, column: 22, scope: !7, inlinedAt: !50)
!50 = distinct !DILocation(line: 35, column: 13, scope: !40)
!51 = !DILocation(line: 35, column: 27, scope: !40)
!52 = !DILocation(line: 37, column: 1, scope: !40)
